class TravelPlace{ //Esta es una "base de datos" con ella usamos el contenido que se muestra en el card (o targeta)
  TravelPlace({ //Representa un lugar turístico con sus propiedades
   required this.name,
   required this.user,
   required this.imagesUrl,
   required this.collectionPlace,
   this.id = '',
   this.description = '',
   this.locationDesc = '',
   this.statusTag = StatusTag.popular,
   this.shared = 0,
   this.likes = 0,  
   });

   final String id;
   final String name;
   final TravelUser user;
   final StatusTag statusTag;
   final int shared;
   final int likes;
   final String locationDesc;
   final String description;
   final List<String> imagesUrl;
   final List<String> collectionPlace;

   static final place = [
    TravelPlace(
      id: '1',
      name: 'Rivera Maya',
      likes: 500,
      shared: 240,
      description:
      'Rivera Maya tiene mas de 120km de costa turquesa cristalina'
      'playas de arena blanca, sitios arqueologicos, parques '
      'naturales y actividades acuaticas unicas',
      imagesUrl: [
        'https://images.unsplash.com/photo-1650359482825-7f86d419cae9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      collectionPlace: [
        'https://images.unsplash.com/photo-1524046909351-84f69445d990?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.lili,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California'
    ),
    TravelPlace(
      id: '2',
      name: 'Kanasin',
      likes: 800,
      shared: 400,
      description:
      'La Ciudad de Kanasin me recuerda a mi natal Cupertino'
      'como los burritos y no se que mas '
      'y el poderoso Duo de Duolingo',
      imagesUrl: [
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      collectionPlace: [
        'https://images.unsplash.com/photo-1524046909351-84f69445d990?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      statusTag: StatusTag.popular, 
      user: TravelUser.alex,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California'
    ),
    TravelPlace(
      id: '4',
      name: 'Maxcanu',
      likes: 1000,
      shared: 540,
      description:
      'Maxcanu, '
      'playas de arena blanca, sitios arqueologicos, parques '
      'naturales y actividades acuaticas unicas',
      imagesUrl: [
        'https://images.unsplash.com/photo-1524046909351-84f69445d990?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      collectionPlace: [
        'https://images.unsplash.com/photo-1524046909351-84f69445d990?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.gabo,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California'
    ),
    TravelPlace(
      id: '5',
      name: 'Cupertino',
      likes: 1000,
      shared: 540,
      description:
      'Mi cuidad natal, '
      'playas de arena blanca, sitios arqueologicos, parques '
      'naturales y actividades acuaticas unicas',
      imagesUrl: [
        'https://images.unsplash.com/photo-1686471158562-4b30c9c717ca?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      collectionPlace: [
        'https://images.unsplash.com/photo-1524046909351-84f69445d990?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      statusTag: StatusTag.popular,
      user: TravelUser.alex,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California'
    ),
   ];
}
class TravelUser {
    TravelUser(this.name, this.urlPhoto);
   
   final String name;
   final String urlPhoto;

   static TravelUser lili = TravelUser('Lily Juarez',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
  static TravelUser alex = TravelUser('Alex Fernandez',
    'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D');
  static TravelUser gabo = TravelUser('Gabriel Dzul',
    'https://images.unsplash.com/photo-1640951613773-54706e06851d?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

    static List<TravelUser> users = [lili, alex];
}

enum StatusTag {popular, event}