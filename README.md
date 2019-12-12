Ruby version -  2.4.1
Rails version - 5.1.7

rake db:seed  #dummy data added to the seed file.

APIs Details:

  1.Vehicle registration
  
     POST /vehicles

  Request body:
  
    { "id": "some-uuid-here" }

  2.Location update
  
    POST /vehicles/:id/locations

  Request body:

    { "lat": 10.0, "lng": 20.0, "at": "2017-09-01T12:00:00Z" }
  
  3. Vehicle de-registration
  
    DELETE /vehicles/:id



Demo URL:  https://quiet-savannah-74894.herokuapp.com/
