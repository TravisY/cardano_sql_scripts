#!/bin/bash

psql -U cardano -d cexplorer -c "drop table if exists stake_hist_grps, stake_hist, block_hist, stake_vs_blocks "

psql -U cardano -d cexplorer -c "Create table stake_hist_grps as
select pool_id, epoch_no, sum (amount) from epoch_stake
    group by pool_id, epoch_no"

echo "Pool stake history by epoch & pool table created"

psql -U cardano -d cexplorer -c "create table stake_hist as
select pool_hash.view, stake_hist_grps.sum as stake_amount, epoch_no from stake_hist_grps
        inner join pool_hash on stake_hist_grps.pool_id = pool_hash.id
        order by epoch_no, pool_hash.view "

echo " Pool hash ids added to stake history table "

psql -U cardano -d cexplorer -c "create table block_hist as
select pool_hash.view, block.epoch_no, count (*) as block_count
    from block inner join slot_leader on block.slot_leader_id = slot_leader.id
    inner join pool_hash on slot_leader.pool_hash_id = pool_hash.id
    group by block.epoch_no, pool_hash.view "

echo " Block History by epoch & pool table table created"

psql -U cardano -d cexplorer -c "create table stake_vs_blocks as
Select stake_hist.view, stake_hist.epoch_no, block_hist.block_count, stake_hist.stake_amount
        from stake_hist 
        left join block_hist
        on stake_hist.epoch_no = block_hist.epoch_no
        and stake_hist.view = block_hist.view "

echo "Joined stake & block tables"

minute=$(date +%M)

psql -U cardano -d cexplorer -c "copy (select * from stake_vs_blocks) to '/tmp/pool_epoch_performance${minute}.csv' with CSV DELIMITER ',' HEADER"

echo "Final join table out as csv as /tmp/pool_epoch_performance${minute}.csv"


