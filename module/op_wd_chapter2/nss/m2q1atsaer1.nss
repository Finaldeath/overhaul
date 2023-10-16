// * Take Skeleton Knuckle, Player Casts 'Free Action'
#include "NW_I0_PLOT"


void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITSKELKNUCKL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));

    ActionDoCommand(AssignCommand(GetLastSpeaker(),ActionCastSpellAtObject(SPELL_FREEDOM_OF_MOVEMENT,OBJECT_SELF)));
}


