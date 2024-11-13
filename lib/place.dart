class TravelPlace{
  TravelPlace({
   required this.name,
   required this.user,
   required this.imagesUrl,
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

   static final place = [
    TravelPlace(
      id: '3',
      name: 'Rivera Maya',
      likes: 500,
      shared: 240,
      description: 
      'Rivera Maya tiene mas de 120km de costa turquesa cristalina'
      'playas de arena blanca, sitios arqueologicos, parques '
      'naturales y actividades acuaticas unicas',
      imagesUrl: [
        'https://images.unsplash.com/photo-1650359482825-7f86d419cae9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        'https://images.unsplash.com/photo-1625851822976-98ed91e641ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      statusTag: StatusTag.popular,
      user: TravelUser.gabo,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California'
    ),
   ];
}