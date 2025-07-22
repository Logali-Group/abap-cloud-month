@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Search.searchable: true

@Analytics: {
  dataCategory: #CUBE,
  internalName: #LOCAL
}

@ObjectModel: {
   supportedCapabilities: [ #ANALYTICAL_PROVIDER ],
   modelingPattern: #ANALYTICAL_CUBE
}

define view entity zana_i_flight_cube_lgl
  as select from zana_b_flight_lgl

  association [1..1] to I_CalendarDate as _FlightDate on _FlightDate.CalendarDate = $projection.FlightDate
{

      /* Dimensions */

      @Search.defaultSearchElement: true
  key CarrierID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key ConnectionID,

      @Search.defaultSearchElement: true
  key FlightDate,

      @Semantics.calendar.year: true
      @ObjectModel.value.derivedFrom: [ 'FlightDate' ]
      @EndUserText.label: 'Flight Year'
      _FlightDate.CalendarYear     as FlightYear,

      @Semantics.calendar.year: true
      @ObjectModel.value.derivedFrom: [ 'FlightDate' ]
      @EndUserText.label: 'Flight Year Quarter'
      _FlightDate.YearQuarter      as FlightYearQuarter,

      @Semantics.calendar.year: true
      @ObjectModel.value.derivedFrom: [ 'FlightDate' ]
      @EndUserText.label: 'Flight Quarter'
      _FlightDate.CalendarQuarter  as FlightQuarter,

      @Semantics.calendar.year: true
      @ObjectModel.value.derivedFrom: [ 'FlightDate' ]
      @EndUserText.label: 'Flight Year Month'
      _FlightDate.YearMonth        as FlightYearMonth,

      @Semantics.calendar.year: true
      @ObjectModel.value.derivedFrom: [ 'FlightDate' ]
      @EndUserText.label: 'Flight Month'
      _FlightDate.CalendarMonth    as FlightMonth,

      PlaneTypeID,

      /* Measures and Units/Currencies */

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Aggregation.default: #SUM
      SalesAmount,
      CurrencyCode,

      @Aggregation.default: #SUM
      SeatsMax                     as MaximumSeats,

      @Aggregation.default: #SUM
      SeatsOccupied,

      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Flights'
      abap.int8'1'                 as NumberOfFlights,

      /*Association*/
      _FlightDate._CalendarQuarter as _CalendarQuarter,
      _FlightDate._CalendarMonth   as _CalendarMonth,
      _FlightDate._YearMonth       as _YearMonth,
      _FlightDate._CalendarYear    as _CalendarYear

}
