//::///////////////////////////////////////////////
//:: Name h4c_throwinvi_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the gem thrower toss gems
     onto the level whenever one is needed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 30, 2003
//:://////////////////////////////////////////////
#include "mimic_inc"
int GemIsNeeded();
void main()
{
    object oMimic = GetObjectByTag("hx_mimic");
    event eEvent = EventUserDefined(7777);
    object oThrower;

    // Only spit out gems if AI is on and one is needed. Only keep one out at a time
    // for each thrower.
    if(GetMimicAI(oMimic) == 1 && GemIsNeeded() <= 7)
    {
        if(GetArea(OBJECT_SELF) == GetArea(oMimic))
        {
            oThrower = GetObjectByTag("h4c_gem_thrower" + IntToString(Random(4) + 1));
            SignalEvent(oThrower, eEvent);
        }
    }
}

// Create a gem on impact.
int GemIsNeeded()
{
    // The target for the gems.
    object oGem = GetNearestObjectByTag("hx_mimic_gem");
    int iCount = 0;

    while(GetIsObjectValid(oGem))
    {
        iCount = iCount + 1;
        oGem = GetNearestObjectByTag("hx_mimic_gem", OBJECT_SELF, iCount + 1);
    }
    return iCount;
}
