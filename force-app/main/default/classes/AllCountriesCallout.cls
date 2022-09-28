public with sharing class AllCountriesCallout {
    //  public static HttpResponse getCountry() {
    //      //1. Prepare HttpRequest & wrap the necessary information in it
    //      HttpRequest request = new HttpRequest();
    //      request.setEndpoint('https://restcountries.com/v2/all');
    //      request.setMethod('GET');
 
    //      //2. Prepare internet
    //      Http http = new Http();
 
    //      //3. Send the HttpRequest over the internet to receive HttpResponse back
    //      HttpResponse response = http.send(request);
 
    //      //4. Process the HttpResponse
    //      if(response.getStatusCode() == 200) {
    //          //jsonString => wrappers => blog records
    //          String jsonString = response.getBody();
    //          System.debug(jsonString);
             
    //          List<wrapperCountry> CountryWrappers = (List<wrapperCountry>)JSON.deserialize(jsonString, List<wrapperCountry>.class);
    //          List<Country__c> countries = new List<Country__c>();
 
    //          for(wrapperCountry cw : CountryWrappers) {
    //              Country__c country = new Country__c();
    //              country.Name = cw.name;
    //              country.Capital__c = cw.capital;
    //              country.Region__c = cw.region;
    //              country.Native_Name__c = cw.nativeName;
    //              // stringi numbere dönüştürüyorum..
    //              country.Population__c = integer.valueOf(cw.population);
    //              country.Flag__c = '<img src='+cw.flags.svg+'></img>';
    //              countries.add(country);
    //          }
    //          try {
    //              if(!countries.isEmpty()) {
    //                  insert countries;
    //              }
    //          } catch(Exception ex) {
    //              //Create a log record
    //              CommonUtility.createLog('AllCountries - getCountry', 'Integration Apex', ex.getStackTraceString(), 'Exception', ex.getTypeName(), ex.getMessage(), '');
    //          }
    //      }
    //      return response;
    // }
 
    // public class wrapperCountry{
    //     public string name;
    //     public string capital;
    //     public string region;
    //     public string nativeName;
    //     public string population;
    //     public flagsWrapper flags;
    // }
 
    // public class flagsWrapper{
    //  public string svg;
    // }
 
 }