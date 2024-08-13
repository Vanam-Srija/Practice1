using {ust.reuse as reuse} from './reuse';
using {cuid,managed,temporal} from '@sap/cds/common';
namespace ust.demo;

context master{
    //we are using address aspect which is there in reuse.cds
    entity student:reuse.address {
        key id : reuse.Guid;  //guid is the custom datatype
        nameFirst:String(80);
        nameLast:String(80);
        age:Integer; 
        class:Association to semester;
    }
     entity book {
        key code: reuse.Guid;
        name:localized String(32);
        author: String(80);
        
    }
    entity semester {
        key id: reuse.Guid;
        name:String(32);
        specialization: String(80);
        hod:String(44);
    }
}

context transaction{

entity subs : cuid, managed, temporal{

student: Association to one master.student;
book : Association to one master.book;
semester: Association to one master.semester;
}
}

