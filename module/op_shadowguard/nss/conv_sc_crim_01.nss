#include "nw_i0_generic"
#include "help_general"

void main()
{
    object o;
    object oWP;
    object oDoor;

    int nNumbOfCFs = 6;

    int i;

    for (i = 1; i <= 3; i++)
    {
        oDoor = GetNearestObjectByTag("DOOR_GHAA_CONTROL_ROOM", OBJECT_SELF, i);

        AssignCommand(oDoor, ActionCloseDoor(oDoor));

        SetLocked(oDoor, TRUE);
    }

    o = OBJECT_SELF;
    AssignCommand(o, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT")));
    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);
    DestroyObject(OBJECT_SELF, 8.0);
    SetLocalInt(GetModule(), "N_ST_1_CP_AMB", 1);

    i = 1;

    SetLocalInt(GetModule(), "N_ST_1_CP_AMB_TOTAL_NUMB", nNumbOfCFs);

    do
    {
        oWP = GetNearestObjectByTag("WP_CT_COMM_CF_FOLL", OBJECT_SELF, i);

        o = CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_CF_FOLL", GetLocation(oWP));

        DelayCommand(1.0, AssignCommand(o, DetermineCombatRound()));

        i++;
    } while (oWP != OBJECT_INVALID);

    o = GetNearestObjectByTag("CT_UNIQ_SH_HARK", GetPCSpeaker());

    RemoveAllEffects(o);
    SceneSpeak(o, "Curses to the Crimson Prophet!  We cannot let him escape Ghaarak alive!  Come, we must deal with these fanatics quickly!");
    ChangeToStandardFaction(o, STANDARD_FACTION_MERCHANT);
    SetPlotFlag(o, FALSE);
    SetImmortal(o, TRUE);
    AssignCommand(o, DetermineCombatRound());

    o = GetFirstPC();

    RemoveAllEffects(o);
    SetCommandable(TRUE, o);
    AssignCommand(o, ClearAllActions(TRUE));

    o = GetHenchman(o);
    RemoveAllEffects(o);
    AssignCommand(o, ClearAllActions(TRUE));

}
