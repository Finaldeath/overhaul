#include "help_general"
#include "help_hench"

void CreateRubble(object o)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_ST_1_RUBBLE", GetLocation(o));
}

void CreateDebris(object o)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_ST_1_DEBRIS", GetLocation(o));
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oDoor = GetNearestObjectByTag("DOOR_015_0_1", oPC);
            location lDoor = GetLocation(oDoor);
            object oHench = GetHenchman(oPC);
            object oGanolin = GetNearestObjectByTag("CT_UNIQ_SH_GANO", oPC);

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lDoor);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oDoor);

            SceneSpeak(oPC, "[Before your dismayed eyes, a great ball of magical fire erupts along the bridge leading to the Docks, destroying the gate immediately and scattering debris all along the path, as well as throwing Imperial Officer Ganolin roughly to the ground...]");
            SceneSpeak(oHench, "It appears our path over the bridge may now be more difficult.  Shall we continue forward, or search for another route to the docks, " + GetName(oPC) + "?");

            AssignCommand(oGanolin, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 10.0));
            AssignCommand(oGanolin, DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), oGanolin)));
            AddJournalSingle("JT_ST_1_MAIN", 12, oPC);
        }
    }
}
