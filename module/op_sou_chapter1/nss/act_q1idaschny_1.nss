//::///////////////////////////////////////////////
//:: Name act_q1idaschny_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Daschnaya's fortune telling effects
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 24/03
//:://////////////////////////////////////////////

void CreateFireLine(object oFirePoint);

void main()
{
    ActionPauseConversation();

    // set the campaign variable on the PC
    SetCampaignInt("Daschnaya", "Daschnaya_Did_Reading", 1, GetPCSpeaker());

    ActionCastFakeSpellAtObject(SPELL_DIVINE_SHIELD, OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT), OBJECT_SELF);

    float fDelay = 2.1;

    DelayCommand(2.1, CreateFireLine(GetObjectByTag("wp_q1i_vfx1_1")));
    DelayCommand(2.1, CreateFireLine(GetObjectByTag("wp_q1i_vfx2_1")));

    DelayCommand(2.6, CreateFireLine(GetObjectByTag("wp_q1i_vfx1_2")));
    DelayCommand(2.6, CreateFireLine(GetObjectByTag("wp_q1i_vfx2_2")));

    DelayCommand(3.1, CreateFireLine(GetObjectByTag("wp_q1i_vfx1_3")));
    DelayCommand(3.1, CreateFireLine(GetObjectByTag("wp_q1i_vfx2_3")));

    DelayCommand(3.6, CreateFireLine(GetObjectByTag("wp_q1i_vfx_end")));

    DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), GetLocation(GetObjectByTag("wp_q1i_vfx_end"))));

    DelayCommand(4.5, ActionResumeConversation());
}

void CreateFireLine(object oFirePoint)
{                                                 //firelarge, sparkstest, soltest, dusttest

    object oFire = CreateObject(OBJECT_TYPE_PLACEABLE, "flamelarge", GetLocation(oFirePoint));
    DestroyObject(oFire, 1.75);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PROT_PREMONITION), GetLocation(oFirePoint), 1.75);
}
