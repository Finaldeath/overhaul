//::///////////////////////////////////////////////
//:: Witchwork 1: Johann, Destroy Self
//:: WW1_Joh_Destroy.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Destroy all versions of Johann
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 24, 2002
//:://////////////////////////////////////////////

void main()
{
    int iNth = 0;
    object oJohann = GetObjectByTag("Johann", iNth);

    //Loop through all copies of Johann, destroying them.
    while (oJohann != OBJECT_INVALID)
    {
        if (oJohann != OBJECT_SELF)
        {
            SetPlotFlag(oJohann, FALSE);
            AssignCommand(oJohann, SetIsDestroyable(TRUE));
            DestroyObject(oJohann, 1.0);
        }
        iNth++;
        oJohann = GetObjectByTag("Johann", iNth);
    }
    SetPlotFlag(OBJECT_SELF, FALSE);
    SetIsDestroyable(TRUE);
    DestroyObject(OBJECT_SELF, 1.0);
}
