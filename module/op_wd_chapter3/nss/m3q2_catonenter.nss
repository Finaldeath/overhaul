//::///////////////////////////////////////////////
//:: M3Q2_CATONENTER.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  If catapult commander for this trigger steps
  on this trigger, he'll start 'firing' the
  catapult again.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////


void main()
{
    if (GetTag(OBJECT_SELF) == "TRIG_" + GetTag(GetEnteringObject()))
    {
        SignalEvent(GetEnteringObject(), EventUserDefined(2003));
    }
}
