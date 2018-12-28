class Actions extends Vanilla_Redux_Actions {
    movePage (data) {
        return {
            type: 'MOVE-PAGE',
            data: data
        };
    }
    fetchRootData () {
        API.get('/', function (response) {
            STORE.dispatch(this.fetchedRootData(response));
        }.bind(this));
    }
    fetchedRootData (response) {
        let makeData = (list) => {
            let ht = {};
            for (var i in list) {
                let _id = list[i]._id;

                if (! ht[_id]) {
                    ht[_id] = list[i];
                } else {
                    let obj = ht[_id];
                    let obj_new = list[i];
                    if (obj_new._class=="NOBIT@")
                        obj.action = obj_new.action;
                }
            }
            return {ht: ht, arr: list};
        };

        return {
            type: 'FETCHED-ROOT-DATA',
            data: {
                nodes: makeData(response.NODES),
                edges: makeData(response.EDGES)
            },
            target: 'stage'
        };
    }
}
