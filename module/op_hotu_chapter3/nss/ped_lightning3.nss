////////////////////////////////////////////////////////////////////////////////////////
// This script will cause the pedastels or gargoyle statues in Podunk's Throne Room
// to shoot lightning at each other.
//
// The targets are designated by the number after the tag. A beam will fire to 1 number
// greater and 1 number less. For example, if the current object's tag is ped16, its
// targets will be ped15 and ped17.
//
// This version is for two digits after the "ped" part of the tag.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////////

void main()
{
    string sTag = GetTag(OBJECT_SELF);
    string sRight = GetStringRight(sTag, 2);
    int iInt = StringToInt(sRight) + 1;
    string sTarget = IntToString(iInt);
    object oTarget = GetObjectByTag("ped" + sTarget);

    if(GetLocalInt(OBJECT_SELF, "iDoOnce") == 0) {
       SetLocalInt(OBJECT_SELF, "iDoOnce", 1);
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_BEAM_LIGHTNING), oTarget);
    }
}
