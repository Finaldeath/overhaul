//::///////////////////////////////////////////////
//:: Name x2_pkeg_ignite
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ignite the fuse on the powderkeg.
*/
//:://////////////////////////////////////////////
//:: Created By:Georg Zoeller
//:: Created On: June 12/03
//:://////////////////////////////////////////////

void DoSmoke()
{
    effect eSmoke = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eSmoke,OBJECT_SELF);
}
// Makes intelligent monsters and humanoids run when a keg is ignited
void DoFlee()
{
    location lLoc = GetLocation(OBJECT_SELF);
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if ((GetAbilityScore(oTarget, ABILITY_INTELLIGENCE)>7) && (!GetIsPC(oTarget)) && GetLocalInt(oTarget,"GZ_CRE_PKEGFLEE")!=TRUE)
        {
        if (GetRacialType(oTarget) == RACIAL_TYPE_HUMAN || GetRacialType(oTarget) == RACIAL_TYPE_DWARF || GetRacialType(oTarget) == RACIAL_TYPE_ELF || GetRacialType(oTarget) == RACIAL_TYPE_FEY ||
            GetRacialType(oTarget) == RACIAL_TYPE_GNOME || GetRacialType(oTarget) == RACIAL_TYPE_HALFELF || GetRacialType(oTarget) == RACIAL_TYPE_HALFLING ||
            GetRacialType(oTarget) == RACIAL_TYPE_HALFORC || GetRacialType(oTarget) == RACIAL_TYPE_OUTSIDER)
            {
                 int nRand=d8();
                 switch(nRand)
                 {
                  case 1: AssignCommand(oTarget,ActionSpeakStringByStrRef(84103));
                          break;
                  case 2: AssignCommand(oTarget,ActionSpeakStringByStrRef(84104));
                          break;
                  case 3: AssignCommand(oTarget,ActionSpeakStringByStrRef(84105));
                          break;
                  case 5: AssignCommand(oTarget,PlayVoiceChat(VOICE_CHAT_FLEE));
                          break;
                  case 6: AssignCommand(oTarget,PlayVoiceChat(VOICE_CHAT_FLEE));
                          break;
                    break;
                 }


            }
             AssignCommand(oTarget,ActionMoveAwayFromObject(OBJECT_SELF,TRUE,20.0f));
             SetLocalInt(oTarget,"X2_CRE_PKEGFLEE",TRUE);

             DelayCommand(16.0f,DeleteLocalInt(oTarget,"X2_CRE_PKEGFLEE"));
        }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE );
    }
}

void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_OBJECT_ACTIVE") == TRUE)
        return;
    SetLocalInt(OBJECT_SELF,"X2_OBJECT_ACTIVE",TRUE);
    if (GetPCSpeaker() != OBJECT_INVALID)
        SetLocalObject(OBJECT_SELF,"X2_OBJECT_ACTIVATOR",GetPCSpeaker());

    DoSmoke();
    float fDetDelay = IntToFloat(d6());

    DelayCommand(2.5f,DoSmoke());
    DelayCommand(5.0f,DoSmoke());
    DelayCommand(3.0+fDetDelay,DoFlee());
    DelayCommand(7.5f,DoSmoke());
    DelayCommand(10.0f,DoSmoke());
    effect eFire = EffectBeam(VFX_BEAM_FIRE,OBJECT_SELF,  BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFire,OBJECT_SELF);
    DelayCommand(8.0f+fDetDelay,ExecuteScript("x2_pkeg_detonate",OBJECT_SELF));



}
