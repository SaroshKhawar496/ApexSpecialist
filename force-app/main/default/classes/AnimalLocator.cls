public class AnimalLocator {
    public static String getAnimalNameById(Integer animalId){
        String animalName = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            System.debug('response: '+ response.getBody());
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped( response.getBody());
            System.debug('results: '+results);
            Map<String,Object> animal = (Map<String,Object>) results.get('animal');
            System.debug('animal naame: '+ animal.get('name'));
            animalName = String.valueOf(animal.get('name'));
        }
        return animalName;
    }
}