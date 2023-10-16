//::///////////////////////////////////////////////
//:: Die Roll: 6d12
//:: DieRoll_G_6d12.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 6d12 broadcast string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

void main()
{
    //Figure out who rolled the dice
    object oRoller = GetPCSpeaker();
    string sName = GetName(oRoller);

    //Roll the dice and tally them up
    int i1d12 = Random(12)+1;
    int i2d12 = Random(12)+1;
    int i3d12 = Random(12)+1;
    int i4d12 = Random(12)+1;
    int i5d12 = Random(12)+1;
    int i6d12 = Random(12)+1;
    int iTotal = i1d12 + i2d12 + i3d12 + i4d12 + i5d12 + i6d12;

    //Convert the rolls and totals to strings
    string s1d12 = IntToString(i1d12);
    string s2d12 = IntToString(i2d12);
    string s3d12 = IntToString(i3d12);
    string s4d12 = IntToString(i4d12);
    string s5d12 = IntToString(i5d12);
    string s6d12 = IntToString(i6d12);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 6d12 ("+s1d12+", "+s2d12+", "+s3d12+", "+s4d12+", "+s5d12+", "+s6d12+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
