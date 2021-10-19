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
Generates Cardano Stake Pool Performance Data as csv. Csv file is output as “/tmp/pool_epoch_performance{minute the output was created}.csv”


### Headers & Sample Rows:
view,epoch_no,block_count,stake_amount
pool103gv6hc8ux9tvu7597f4806fayzeyvrn2pp338ndztgl6jg29mf,210,,228768130669
pool104fdj0xdhr8cqedwn0lf8dk206ryn62kn8mtyym020nuxthjgvj,210,,1440874302339
pool104re5tajgh4mpp7c744khap56lf609cfjlna5ysjkum8qn8fel9,210,,322138901748
pool108zdflss3ayqlm5c7vr6mtqj2uwl99vk28ur8dv4zswdzt6yauc,210,,15256980865905
pool10capak8jppvj8h46e35xdth6h22pahtr3lcgscrpa06jzv0xn8w,210,,5527457577928
pool10dwjth7esfw5gc036vu6l6csnvn6elqax0d3kh8t65rxyewk2g3,210,,3300000000000
pool10efuydxjnasr0309lqklmj9xahupdnzqd59r5dqjeh4twz06tr0,210,,9270972439711
pool10eltx2wej46e62ulmwzm35xfu0azu47yvpjper7gwhncqe74vg6,210,,76005541636
pool10gllgflzl3ngg0fj2xas9hfww25zxn2fdwtc0gd44am92pdlr7p,210,,339658592230
