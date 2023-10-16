//::///////////////////////////////////////////////
//:: Catapults!: Master Include File
//:: Inc_Catapults!.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////



//::///////////////////////////////////////////////
//:: RandomLocation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns a random location within the
     boundaries defined by two Corner Designator
     waypoints.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

location RandomLocation()
{
    int bLocationValid = FALSE;

    while (bLocationValid == FALSE)
    {
        //Determine the spawn boundary using the Corner Designator waypoints.
        object oCorner1 = GetObjectByTag("CornerDesignator", 0);
        object oCorner2 = GetObjectByTag("CornerDesignator", 1);
        vector vCorner1 = GetPosition(oCorner1);
        vector vCorner2 = GetPosition(oCorner2);
        int iCorner1_X = FloatToInt(vCorner1.x);
        int iCorner1_Y = FloatToInt(vCorner1.y);
        int iCorner2_X = FloatToInt(vCorner2.x);
        int iCorner2_Y = FloatToInt(vCorner2.y);
        float fNew_X;
        float fNew_Y;

        //Define random X & Y coordinates within the defined spawn boundary.
        if (iCorner1_X > iCorner2_X)
        {
            fNew_X = IntToFloat(Random(iCorner1_X - iCorner2_X) + iCorner2_X);
        }
        else
        {
            fNew_X = IntToFloat(Random(iCorner2_X - iCorner1_X) + iCorner1_X);
        }

        if (iCorner1_Y > iCorner2_Y)
        {
            fNew_Y = IntToFloat(Random(iCorner1_Y - iCorner2_Y) + iCorner2_Y);
        }
        else
        {
            fNew_Y = IntToFloat(Random(iCorner2_Y - iCorner1_Y) + iCorner1_Y);
        }

        //Compile the new location.
        object oArea = GetArea(oCorner1);
        vector vNew = Vector(fNew_X, fNew_Y);
        float fNew_Orientation = IntToFloat(Random(360)+1);
        location lNew = Location(oArea, vNew, fNew_Orientation);

        //Check the location to make sure it's not already occupied.
        object oValidation = GetFirstObjectInShape(SHAPE_SPHERE, 2.0, lNew);
        if (oValidation == OBJECT_INVALID)
        {
            bLocationValid = TRUE;
            //Return the validated location
            return lNew;
        }
    }

    //If there's an error, return the caller's location.
    return GetLocation(OBJECT_SELF);
}


//::///////////////////////////////////////////////
//:: Blast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Parses any valid targets within a Blast
     impact and saves them out as Local Objects
     which are then handled by the ProcessBlast()
     function below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void Blast(object oTarget, object oImpactOwner)
{
    string sTarget = GetTag(oTarget);

    //If they hit a Power-Up Creature or Catapult, save them out as objects.
    if (sTarget == "PARALYZER" ||
        sTarget == "SCRAMBLER" ||
        sTarget == "BLASTER"   ||
        sTarget == "PROTECTOR" ||
        sTarget == "IMPLODER"  ||
        sTarget == "SEEKER"    ||
        sTarget == "Catapult")
    {
        int iBlastNth = GetLocalInt(oImpactOwner, "iBlastNth");
        iBlastNth++;
        SetLocalInt(oImpactOwner, "iBlastNth", iBlastNth);
        SetLocalObject(oImpactOwner, "oBlastTarget_"+IntToString(iBlastNth), oTarget);
    }
}


//::///////////////////////////////////////////////
//:: ProcessBlast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Processes any Local Objects saved out in the
     Blast() function.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void ProcessBlast(object oImpactOwner)
{
    int iNth = 1;
    int iBlastNth = GetLocalInt(oImpactOwner, "iBlastNth");

    while (iNth <= iBlastNth)
    {
        object oTarget = GetLocalObject(oImpactOwner, "oBlastTarget_"+IntToString(iNth));
        string sTarget = GetTag(oTarget);

        //Ensure that the target is not currently PROTECTED
        int bProtected = GetLocalInt(oTarget, "bProtected");

        //Clear the object from memory and increment iNth to check for the next object.
        SetLocalObject(oImpactOwner, "oBlastTarget_"+IntToString(iNth), OBJECT_INVALID);
        iNth++;
    }
    //When the loop is complete, clear the iBlastNth value.
    SetLocalInt(oImpactOwner, "iBlastNth", 0);
}


//::///////////////////////////////////////////////
//:: HandleImpactTargets
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handles the behavior of any valid targets
     within the impact radius.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2002
//:://////////////////////////////////////////////

void HandleImpactTargets(location lImpact, float fRadius, object oImpactOwner, string sImpactType)
{
    //Calculate the timing delay.
    int iRange = GetLocalInt(oImpactOwner, "iRange");
    float fImpactDelay = IntToFloat(iRange)/12;

    //Parse the impact radius for catapults & POWER-UP creatures...
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);

    while (oTarget != OBJECT_INVALID)
    {
        //If hit by a Blast (Catapult, BLASTER, or SEEKER)...
        if (sImpactType == "Blast")
        {
            DelayCommand(fImpactDelay, Blast(oTarget, oImpactOwner));
            //The Blast() only saves the targets out as local objects. The
            //actual destruction and processing of those objects must be
            //handled from outside of the GetFirst/GetNext loop. See
            //ProcessBlast() below.
        }


        oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
    }
    DelayCommand(fImpactDelay, ProcessBlast(oImpactOwner));

}


