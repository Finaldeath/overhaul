//::///////////////////////////////////////////////
//:: Name hx_skeleton
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create 4 skeletons from the remains
     in the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////

void DelayCreateObject(int iType, string sName, location lLoc);

void main()
{
    object oPC = GetEnteringObject();
    string sBones = "q4a_headstone";
    string sSkele = "skeletalminion";
    // Bone counter. We only want 4 skeles each time.
    int x = 1;
    int iSeen = GetLocalInt(OBJECT_SELF, "HX_SkeleTriggerFired");
    float fDelay = 0.0;
    object oBones = GetNearestObjectByTag(sBones, OBJECT_SELF, x);

    if(GetIsPC(oPC) && iSeen != 1)
    {
        SetLocalInt(OBJECT_SELF, "HX_SkeleTriggerFired", 1);
        while(x < 5)
        {
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_RAISE_DEAD), oBones));
            DelayCommand(fDelay, DelayCreateObject(OBJECT_TYPE_CREATURE, sSkele, GetLocation(oBones)));
            DelayCommand(fDelay + 2.0, DestroyObject(oBones));
            fDelay = fDelay + 0.5;
            x = x + 1;
            oBones = GetNearestObjectByTag(sBones, OBJECT_SELF, x);
        }
    }
}

// Delayed CreateObject
void DelayCreateObject(int iType, string sName, location lLoc)
{
    CreateObject(iType, sName, lLoc);
}
