// Enter manticore lair: start cutscene only if archer is dead (otherwise - the cutscene trigger
// is the archer digging himself out of the room

#include "nw_i0_plot"
#include "q1_cutscene"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    //object oArcher = GetNearestObjectByTag("Q1_STINGER_ARC3");
    //if(!GetIsDead(oArcher))
    //    return;
    if(GetIsPossessedFamiliar(oPC))
    {
        UnpossessFamiliar(oPC);
        return;
    }
    //MusicBackgroundStop(GetArea(OBJECT_SELF));
    //MusicBattleChange(GetArea(OBJECT_SELF), 0);
    //MusicBattleStop(GetArea(OBJECT_SELF));
    // using the following var in the abort of the cutscene to remove only the effects that this object created
    SetLocalObject(GetModule(), "Q1_CUTSCENE_OBJECT", OBJECT_SELF);
    StartCutscene(oPC);
}
