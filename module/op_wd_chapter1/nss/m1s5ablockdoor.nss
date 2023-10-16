#include "NW_I0_Plot"
void main()
{
    int nNth = 1;
    object oPatron = GetNearestCreature(CREATURE_TYPE_CLASS,CLASS_TYPE_COMMONER,OBJECT_SELF,nNth);
    while(GetIsObjectValid(oPatron))
    {
        AssignCommand(oPatron,ClearAllActions());
        AssignCommand(oPatron,SpeakOneLinerConversation());

        AssignCommand(oPatron,EscapeArea(TRUE,"WP_PatronFlee"));
        nNth++;
        oPatron = GetNearestCreature(CREATURE_TYPE_CLASS,CLASS_TYPE_COMMONER,OBJECT_SELF,nNth);
    }
}
