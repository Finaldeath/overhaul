//Have Gnoll attack Deekin's door and shout out
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        object oDoor = GetObjectByTag("q6_deekin_door_ext");
        object oGnoll = GetObjectByTag("q6_doorkiller");
        AssignCommand(oGnoll, SpeakStringByStrRef(40270));
        AssignCommand(oGnoll, ActionAttack(oDoor));
        ChangeToStandardFaction(oGnoll, STANDARD_FACTION_HOSTILE);
        DestroyObject(OBJECT_SELF);
    }
}
