//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that PC spoke to Drezzy and makes Drezzy
     pass out.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"DREZZYTALK",10);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectSleep(),OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,EffectVisualEffect(VFX_IMP_SLEEP), GetLocation(OBJECT_SELF));
}
