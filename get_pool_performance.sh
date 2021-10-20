#!/bin/bash

psql -U cardano -d cexplorer -c "drop table if exists stake_hist_grps, stake_hist, block_hist, pool_relay_count, stake_vs_blocks "

psql -U cardano -d cexplorer -c "Create table stake_hist_grps as
select pool_id, epoch_no, sum (amount), count(amount) as delegators from epoch_stake
    group by pool_id, epoch_no"

echo "Pool stake history by epoch & pool table created"

psql -U cardano -d cexplorer -c "create table stake_hist as
select pool_hash.view as pool_id, stake_hist_grps.sum as stake_amount,
 stake_hist_grps.delegators, epoch_no from stake_hist_grps
        inner join pool_hash on stake_hist_grps.pool_id = pool_hash.id
        order by epoch_no, pool_hash.view "

echo " Pool hash ids added to stake history table "

psql -U cardano -d cexplorer -c "create table block_hist as
select pool_hash.view as pool_id, block.epoch_no, count (*) as block_count
    from block inner join slot_leader on block.slot_leader_id = slot_leader.id
    inner join pool_hash on slot_leader.pool_hash_id = pool_hash.id
    group by block.epoch_no, pool_hash.view "

echo " Block History by epoch & pool table table created"

psql -U cardano -d cexplorer -c "create table stake_vs_blocks as
Select stake_hist.pool_id, stake_hist.epoch_no, block_hist.block_count, stake_hist.stake_amount,
stake_hist.delegators
        from stake_hist 
        left join block_hist
        on stake_hist.epoch_no = block_hist.epoch_no
        and stake_hist.pool_id = block_hist.pool_id "

echo "Joined stake & block tables"

psql -U cardano -d cexplorer -c "create table pool_relay_count as
select pool_hash.view as pool_id, count(pool_relay.update_id) as relays from pool_relay inner join pool_hash on pool_hash.id = pool_relay.update_id  
group by pool_hash.view "

echo "# of Relays per pool added"

date=$(date +%m%d%y%H%M)

psql -U cardano -d cexplorer -c "copy (select stake_vs_blocks.pool_id, stake_vs_blocks.epoch_no, stake_vs_blocks.block_count, stake_vs_blocks.stake_amount, 
 stake_vs_blocks.delegators, pool_relay_count.relays 
  from stake_vs_blocks left join pool_relay_count on stake_vs_blocks.pool_id = pool_relay_count.pool_id) to '/tmp/pool_epoch_performance${date}.csv' with CSV DELIMITER ',' HEADER"

echo "Final join table out as csv as /tmp/pool_epoch_performance${date}.csv"

