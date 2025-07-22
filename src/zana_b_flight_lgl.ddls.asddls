@AbapCatalog.viewEnhancementCategory: [ #NONE ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base - Flight'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity zana_b_flight_lgl
  as select from /dmo/flight
{
  key carrier_id                                       as CarrierID,
  key connection_id                                    as ConnectionID,
  key flight_date                                      as FlightDate,

      plane_type_id                                    as PlaneTypeID,
      seats_max                                        as SeatsMax,
      seats_occupied                                   as SeatsOccupied,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Sales Amount'
      cast( price as abap.dec(16,2) ) * seats_occupied as SalesAmount,
      currency_code                                    as CurrencyCode
}
