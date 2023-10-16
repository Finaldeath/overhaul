//::///////////////////////////////////////////////
//:: Name q2d4_ent_illchk2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have a chance to disbelieve the illusionary terrain.
    If successful - Do some effects and spawn in a chest
    (real chest)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 13/03
//:://////////////////////////////////////////////

void RemoveObstruction();
void RemoveIllusion();
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //have pc make a Will DC check vs DC 25 to disbelieve the illusion.
    if (WillSave(oPC, 25, SAVING_THROW_TYPE_SPELL) > 0)
    {
        PlayVoiceChat(VOICE_CHAT_LOOKHERE, oPC);
        FloatingTextStrRefOnCreature(85718, oPC);
        RemoveObstruction();
        RemoveIllusion();
    }
    DestroyObject(OBJECT_SELF, 0.5);
}

//Each illusion is covered by 4 blocks for walking purposes
void RemoveObstruction()
{
    object oBlock;
    int nCount;
    for (nCount = 1; nCount < 5; nCount++)
    {
        oBlock = GetNearestObjectByTag("q2d_vfx_block", OBJECT_SELF, nCount);
        DestroyObject(oBlock);
    }
}
//create a flash effect and remove the VFX tile
void RemoveIllusion()
{
    object oIllusion = GetNearestObjectByTag("q2d4_vfx_final");
    location lSpawn = GetLocation(oIllusion);
    effect eVis1 = EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eVis2 = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    effect eLink = EffectLinkEffects(eVis1, eVis2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lSpawn);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2d_illchest2", lSpawn);
    DestroyObject(oIllusion);
}
