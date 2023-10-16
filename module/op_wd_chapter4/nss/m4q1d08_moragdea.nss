//* MOrag dies, says one last line and then explodes
#include "nw_i0_plot"
#include "achievement_lib"

// * blows things up at end of game
void KillObject(object oToKill)
{
    effect eDamage = EffectDamage(1000);
    float fRandom = IntToFloat(Random(100)) * 0.001;
    DelayCommand(fRandom, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamage, oToKill));
}

void main()
{
    RewardXP("M4Q01_MAIN",100,GetLastKiller());
    AddJournalQuestEntry("M4Q01_MAIN",99,GetLastKiller());
    SetLocalInt(OBJECT_SELF,"NW_L_AMDEAD",10);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectResurrection(), OBJECT_SELF);
    SetPlotFlag(OBJECT_SELF,TRUE);
    effect eVis = EffectVisualEffect(VFX_IMP_SUNSTRIKE);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocation(OBJECT_SELF));
    SpeakOneLinerConversation();
    SetPlotFlag(OBJECT_SELF,FALSE);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_FNF_IMPLOSION), GetNearestObjectByTag("ThroneEvil1"));
    KillObject(GetNearestObjectByTag("M_FireWall_1"));
    KillObject(GetNearestObjectByTag("M_FireWall_2"));
    KillObject(GetNearestObjectByTag("M_FireWall_3"));
    KillObject(GetNearestObjectByTag("M_FireWall_4"));
    KillObject(GetNearestObjectByTag("ShaftofLightRed1"));
    KillObject(GetNearestObjectByTag("ShaftofLightRed2"));
    KillObject(GetNearestObjectByTag("ThroneEvil1"));


    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_FIRE"));
    KillObject(GetNearestObjectByTag("M4Q1D2_FIRE"));
    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_COLD"));
    KillObject(GetNearestObjectByTag("M4Q1D2_COLD"));
    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_OTHE"));
    KillObject(GetNearestObjectByTag("M4Q1D2_OTHE"));
    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_BLUN"));
    KillObject(GetNearestObjectByTag("M4Q1D2_BLUN"));
    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_PIER"));
    KillObject(GetNearestObjectByTag("M4Q1D2_PIER"));
    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_ELEC"));
    KillObject(GetNearestObjectByTag("M4Q1D2_ELEC"));
    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_SLAS"));
    KillObject(GetNearestObjectByTag("M4Q1D2_SLAS"));
    KillObject(GetNearestObjectByTag("M4Q1D08_IMM_POIS"));
    KillObject(GetNearestObjectByTag("M4Q1D2_POIS"));


    KillObject(GetNearestObjectByTag("m4sac1"));
    KillObject(GetNearestObjectByTag("m4sac2"));
    KillObject(GetNearestObjectByTag("m4sac3"));
    KillObject(GetNearestObjectByTag("m4sac4"));



    KillObject(GetNearestObjectByTag("m4sac1_c"));
    KillObject(GetNearestObjectByTag("m4sac2_c"));
    KillObject(GetNearestObjectByTag("M4_MIN_HULK"));
    KillObject(GetNearestObjectByTag("M4_MIN_RENDER"));

    DestroyObject(OBJECT_SELF, 1.0);


    // * all the post-plot stuff requires this to work
    SetLocalInt(GetModule(),"NW_G_MORAGDEAD", 10);

    DifficultyAchievements(GetFirstPC(), OBJECT_SELF, GetGameDifficulty());

}
