# cardano_sql_scripts
Scripts for extracting data from the Cardano Blockchain as csv. 

### Prerequisites:
1. Need a running Cardano Node
  - More information on Setting up a node: [Cardano Node Setup](https://cardano-community.github.io/guild-operators/Build/node-cli/)
2. PostgreSQL needs to be setup
  - Simple instructions can be found here: [Simple PostgreSQL Setup](https://cardano-community.github.io/guild-operators/Appendix/postgres/)
3. Cardano db sync built and running
  - Instructions can be found here; [Cardano db sync setup](https://cardano-community.github.io/guild-operators/Build/dbsync/)

Thanks to the Cardano Guild Operators for streamlining the setup process.

—-

## Pool Performance
Generates Cardano Stake Pool Performance Data as csv. Csv file is output as “/tmp/pool_epoch_performance{monthdayyearhourminute}.csv”


### Headers & Sample Rows:
view  |  epoch_no   |   block_count |  stake_amount  |  delegators   |   relays

pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,253,34,35681950699020,511,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,258,35,30089256698224,560,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,280,26,35342112505275,824,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,281,26,29243378075941,823,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,284,29,29413429180771,848,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,283,36,30042778914254,857,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,279,34,35583006510005,800,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,282,24,28815742494774,839,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,285,32,28461215459589,862,1
pool1zz7x8ergn02chznayj9fjds2gk5q6prmpdr49faspd65kzqsrjs,278,41,34814394554460,741,1
