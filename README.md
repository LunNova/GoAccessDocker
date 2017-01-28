**Application**

[GoAccess](https://goaccess.io)

**Description**

GoAccess is a real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser. https://goaccess.io


**Usage**
```
docker run -d \
    --name=<container name> \
    -v <path to logs>:/log \
    -v <path to generated output HTML>:/report \
    -v /etc/localtime:/etc/localtime:ro \
    rossallan/goaccess
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

`<host ip>:25565`

**Example**
```
docker run -d \
    --name=goaccess \
    -v /mnt/appdata/nginx/logs:/log \
    -v /mnt/appdata/nginx/sites/stats.allan.scot:/report \
    -v /etc/localtime:/etc/localtime:ro \
    rossallan/goaccess
```

