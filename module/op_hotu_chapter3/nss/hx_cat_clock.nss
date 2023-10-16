//::///////////////////////////////////////////////
//:: Catapult: Turn Clockwise
//:: hx_cat_clock
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rotates the catapult clockwise to the next
    prison.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 2, 2003
//:://////////////////////////////////////////////

void main()
{
    object oFacing = GetLocalObject(OBJECT_SELF, "HX_FINAL_FACING");
    string sTag = GetTag(oFacing);
    object oNew;
    int iNum = StringToInt(GetStringRight(sTag, 2));

    if(sTag == "hx_catapult_facing_12")
    {
        oNew = GetObjectByTag("hx_catapult_facing_01");
    }
    else
    {
        if(iNum == 9 || iNum == 10 || iNum == 11)
        {
            oNew = GetObjectByTag("hx_catapult_facing_" + IntToString(iNum + 1));
        }
        else
        {
            oNew = GetObjectByTag("hx_catapult_facing_0" + IntToString(iNum + 1));
        }
    }

    SetLocalObject(OBJECT_SELF, "HX_FINAL_FACING", oNew);
    PlaySound("as_sw_woodplate1");
    DelayCommand(0.1, SetFacingPoint(GetPosition(oNew)));
}
