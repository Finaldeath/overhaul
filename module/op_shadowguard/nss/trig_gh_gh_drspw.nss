#include "help_general"
#include "help_hench"

void CrimsonFollowerSpawns(object oPC)
{
    object oWP;
    location lWP;
    object o;

    SceneSpeak(oPC, "[Two of the fanatics descend swiftly down ropes dangling from the windows of the Grand Hall, rushing to keep you from opening the gates...");

    oWP = GetNearestObjectByTag("WP_CT_CRIM_FOLL_SPAWN");
    lWP = GetLocation(oWP);

    o = CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_CF_FOLL", lWP);

    SetLocalObject(OBJECT_SELF, "O_C1", o);

    oWP = GetNearestObjectByTag("WP_CT_CRIM_FOLL_SPAWN", OBJECT_SELF, 2);
    lWP = GetLocation(oWP);

    o = CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_CF_FOLL", lWP);

    SetLocalObject(OBJECT_SELF, "O_C2", o);
}

void CrimsonFollowerManager(object oPC)
{
    object oC1 = GetLocalObject(OBJECT_SELF, "O_C1");

    object oC2 = GetLocalObject(OBJECT_SELF, "O_C2");

    if (GetLocalInt(GetModule(), "N_ST_1_GH_GH_DOOR_OPEN") == 0 && GetJournalQuestState("JT_ST_1_MAIN", oPC) < 6)
    {
        if (!(GetIsObjectValid(oC1)) && !(GetIsObjectValid(oC2)))
            CrimsonFollowerSpawns(oPC);

        DelayCommand(15.0, CrimsonFollowerManager(oPC));
    }
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(GetMaster(oPC)))
        oPC = GetMaster(oPC);

    if (GetIsPC(oPC))
        if (GetFirstTimeIn())
            CrimsonFollowerManager(oPC);
}
