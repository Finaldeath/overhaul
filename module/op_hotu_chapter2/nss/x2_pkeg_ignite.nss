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

    DelayCommand(7.5f,DoSmoke());
    DelayCommand(10.0f,DoSmoke());
    effect eFire = EffectBeam(VFX_BEAM_FIRE,OBJECT_SELF,  BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFire,OBJECT_SELF);
    DelayCommand(8.0f+fDetDelay,ExecuteScript("x2_pkeg_detonate",OBJECT_SELF));



}
