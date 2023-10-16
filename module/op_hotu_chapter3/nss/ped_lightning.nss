////////////////////////////////////////////////////////////////////////////////////////
// This script will cause the pedastels or gargoyle statues in Podunk's Throne Room
// to shoot lightning at each other.
//
// The targets are designated by the number after the tag. A beam will fire to 1 number
// greater and 1 number less. For example, if the current object's tag is ped6, its
// targets will be ped5 and ped7.
//
// This version is for single digits after the "ped" part of the tag.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////////

void main()
{
    string sTag = GetTag(OBJECT_SELF);
    string sRight = GetStringRight(sTag, 1);
    int iInt = StringToInt(sRight) + 1;
    int iInt2 = StringToInt(sRight) - 1;
    string sTarget = IntToString(iInt);
    string sTarget2 = IntToString(iInt2);
    object oTarget = GetObjectByTag("ped" + sTarget);
    object oTarget2 = GetObjectByTag("ped" + sTarget2);


    if(GetLocalInt(OBJECT_SELF, "iDoOnce") == 0) {
       SetLocalInt(OBJECT_SELF, "iDoOnce", 1);
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_BEAM_LIGHTNING), oTarget);
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_BEAM_LIGHTNING), oTarget2);
    }
}
