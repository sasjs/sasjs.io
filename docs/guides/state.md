# State Management

Best practice for building web apps is for each service to be 'stateless'.  If your logic depends on state, then that state can be managed in a number of ways:

!!! Warning
  Do not use SAS 9 sessions!  They can unbalance your load balancer.
  Do not use url params!  They can cause code injection.

## Cookies
Small amounts of data can be kept on the user browser in the form of cookies.  These are accessed in SAS by means of the `_htcook` macro variable, accessed as follows:

```
proc sql noprint;
select * from dictionary.macros where name=”_HTCOOK” ;
```