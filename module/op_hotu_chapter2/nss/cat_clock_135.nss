//::///////////////////////////////////////////////
//:: Catapult: Turn Clockwise 135 Degrees
//:: Cat_Clock_135.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rotates the catapult clockwise by 135 degrees.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Aug 29, 2002
//:://////////////////////////////////////////////

void main()
{
    float fCurrent = GetFacing(OBJECT_SELF);

//////////////////////////////////////////////////////////
    //This is a hack to work around a known GetFacing() //
    //math error in the scripting language. It can be   //
    //removed once the issue has been patched.          //
    if (fCurrent > 360.0)                               //
    {                                                   //
        fCurrent = 720 - fCurrent;                      //
    }                                                   //
//////////////////////////////////////////////////////////

    float fNew = fCurrent - 135.0;

    if (fNew <= 0.0)
    {
        fNew = fNew + 360.0;
    }

    SetFacing(fNew);
}
