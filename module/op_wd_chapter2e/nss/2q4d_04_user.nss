//::///////////////////////////////////////////////
//:: User Defined
//:: 2q4d_04_user
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 24, 2002
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oAltar = GetObjectByTag("2q4d_04_altar");
    object oLight = GetObjectByTag("2q4d_04_light");
    object oDoor = GetObjectByTag("2q4_ToLevel2");

    location lAltar = GetLocation(oAltar);
    location lDoor = GetLocation(oDoor);

    if (nEvent = 400)
    {
        SetPlotFlag(oLight,FALSE);
        SetPlotFlag(oAltar,FALSE);
        SetPlotFlag(oDoor,FALSE);
        DestroyObject(oLight);
        SetLocalInt(oAltar,"NW_L_SealBroken",1);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL),lAltar);
        DelayCommand(1.0,AssignCommand(oAltar,SpeakOneLinerConversation()));
        DelayCommand(1.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),lAltar));
        DelayCommand(1.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(100),oAltar));
        DelayCommand(2.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_FIREBALL),lDoor));
        DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(100),oDoor));
    }
}
