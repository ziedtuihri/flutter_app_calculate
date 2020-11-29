import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
   {
     'en': {
       'title':'Hello World %s',
       'next' :'NEXT',
       'back' : 'BACK',
       'valide' : 'Validate Email',
       'correct' : 'Email Correct',
       'formatgood':'Good Email Format',
       'incorrect' :'Email incorrect',
       'formatbad':'Bad Email Format'
  },
     'fr':{
       'title':'Main Page %s',
       'next' :'SUIVANT',
       'back' :'RETOUR',
       'valide' : 'valider Email ',
       'correct' : 'Email Correct',
       'formatgood':'Bon Email Format',
       'incorrect' :'Email incorrect',
       'formatbad':'Mauvais Email Format'
     } , 

  };

}