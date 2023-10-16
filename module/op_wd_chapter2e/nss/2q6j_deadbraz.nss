//::///////////////////////////////////////////////
//:: Spawn Monster on Brazier Death
//:: 2q6j_deadbraz
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in a monster based on the number of
    braziers that have been destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 30, 2002
//:://////////////////////////////////////////////

void CreateMonster(string sTag);
void DestroyCage(string sTag);

void main()
{
    int nLocal = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6J_FREE_ARKLEM");
    string sTag;

    if(nLocal == 0)
    {
        sTag = "nw_skeldevour";
    }
    else if (nLocal == 1)
    {
        sTag = "nw_firegreat";
    }
    else if (nLocal == 2)
    {
        sTag = "nw_golbone";
    }
    else if (nLocal == 3)
    {
        object oLich = GetNearestObjectByTag("2q6j_arklem");
        if(GetIsObjectValid(oLich))
        {
            SetLocalInt(oLich, "ARKLEM_PLOT", 3);
        }
        sTag = "nw_slaaddeth";
        DestroyCage("2q6j_ArklemPrison");
    }
    if(sTag != "")
    {
        CreateMonster(sTag);
    }
    nLocal++;
    SetLocalInt(GetArea(OBJECT_SELF),"NW_2Q6J_FREE_ARKLEM", nLocal);
}

void CreateMonster(string sTag)
{
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    object oWay = GetWaypointByTag("NW_2Q6J_FREE_ARKLEM");

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWay));
    CreateObject(OBJECT_TYPE_CREATURE, sTag, GetLocation(oWay), TRUE);
}

void DestroyCage(string sTag)
{
    object oVFX = GetNearestObjectByTag(sTag);
    if(GetIsObjectValid(oVFX))
    {
        SetPlotFlag(oVFX, FALSE);
        DestroyObject(oVFX);
        DelayCommand(0.1, DestroyCage(sTag));
    }
}
