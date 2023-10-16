#include "help_general"

void CreateCPHelper(object o, string s)
{
    int n = GetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB");
    n++;
    SetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB", n);

    object oNew = CreateObject(OBJECT_TYPE_CREATURE, s, GetLocation(o));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), GetLocation(o));
    SetLocalInt(oNew, "N_ST_1_CP_ENC", 1);
}

void CreateSpecialDemon()
{
    int n = GetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB");
    n++;
    SetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB", n);

    string s = "CT_UNIQ_CF_DM_1";
    object o = CreateCreatureOnWP(s, GetFirstPC());

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMONDRAGON), o);

    SetLocalInt(o, "N_ST_1_CP_ENC", 1);
}

void main()
{
    object oPC = GetPCSpeaker();

    // Cast for cutscene
    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");
    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");
    object oMarkius = GetNearestObjectByTag("HENCH_MARK");
    object oLyen = GetNearestObjectByTag("HENCH_LYEN");
    object oKara = GetNearestObjectByTag("HENCH_KARA");
    object oBrukus = GetNearestObjectByTag("HENCH_BRUK");
    object oTarin = GetNearestObjectByTag("HENCH_TARI");

    // EXTRA CODE BELOW
    AssignCommand(oCP, ActionMoveToObject(GetNearestObjectByTag("DOOR_ST_1_DOCK_DOOR_CP", oCP), TRUE));

    string s = "CT_COMM_CF_DM_1";
    object o = GetNearestObjectByTag("WP_" + s);

    int j = 1;
    float fTimer;

    while (o != OBJECT_INVALID && GetArea(o) == GetArea(oCP))
    {
        fTimer = IntToFloat(j) / 3;
        DelayCommand(fTimer, CreateCPHelper(o, s));

        j++;
        o = GetNearestObjectByTag("WP_" + s, OBJECT_SELF, j);
    }

    DelayCommand(fTimer, CreateSpecialDemon());
    DelayCommand(fTimer, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), oCP));

    o = GetFirstObjectInArea();

    RemoveAllEffects(oPC);
    RemoveAllEffects(oMarkius);
    RemoveAllEffects(oLyen);
    RemoveAllEffects(oKara);
    RemoveAllEffects(oBrukus);
    RemoveAllEffects(oTarin);
}
