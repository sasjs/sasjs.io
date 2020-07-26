State Management
====================

Best practice for building web apps is for each service to be 'stateless'. If your logic depends on state, then that state can be managed in a number of ways:

<!-- prettier-ignore -->
!!! Warning
    Do not use SAS 9 sessions! They can unbalance your load balancer.
    Do not use url params! They can cause code injection.

## Cookies

Small amounts of data can be kept on the user browser in the form of cookies. These are accessed in SAS by means of the `_htcook` macro variable, accessed as follows:

```sas
proc sql noprint;
select * from dictionary.macros where name="_HTCOOK" ;
```

<meta name="description" content="Tips & Tricks for building apps - dealing with browser state for optimal performance and functionality">