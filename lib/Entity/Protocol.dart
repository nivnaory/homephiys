import 'package:homephiys/Entity/SubProtocol.dart';

class Protocol{
   String _name;
   List<SubProtocol> _subProtocolsList;
   int _protocolId;

  Protocol(String name,int protocolId){
    this._name=name;
    this._protocolId=protocolId;
    _subProtocolsList=[];
  }

   List<SubProtocol> get subProtocolsList => _subProtocolsList;
   String get name => _name;
   int get protocolId => _protocolId;

   void addSubProtocol(SubProtocol sub){
     _subProtocolsList.add(sub);
   }
}