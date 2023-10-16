//::///////////////////////////////////////////////
//:: Name hx_slp_sentp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sensei flees after cussing. (Non-destroy
     variant).
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSensei = GetObjectByTag("H2_Sensei");
    location lLoc = GetLocation(oSensei);

    PlayVoiceChat(VOICE_CHAT_CUSS, oSensei);
    DelayCommand(0.2, AssignCommand(oSensei, ActionCastFakeSpellAtObject(SPELL_BANISHMENT, OBJECT_SELF)));
    DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oSensei));
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), lLoc));
    //DestroyObject(oSensei, 1.0);
}

