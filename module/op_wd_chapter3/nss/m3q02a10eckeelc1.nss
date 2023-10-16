// * Eckel gives the player the note
#include "M3PLOTINCLUDE"
void main()
{
   SetLocalObject(OBJECT_SELF," NW_L_M3Q02PLOTNOTETAKER",GetPCSpeaker());
   SetLocalInt(OBJECT_SELF, "NW_L_M3Q02PLOTECKELNOTE",1);
   EckelGiveNote(GetPCSpeaker());
}
