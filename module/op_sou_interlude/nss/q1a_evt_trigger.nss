// run the normal trigger, and destroy all the rest



void main()
{
    object oEnter = GetEnteringObject();
    int bIAmAnAssociate = FALSE;
    // * only valid if I am an henchman, otherwise exit
    if (GetAssociate(ASSOCIATE_TYPE_HENCHMAN, GetMaster(oEnter)) == oEnter)
    {
        bIAmAnAssociate = TRUE;
    }

    if ( !bIAmAnAssociate) return;
    if(GetLocalInt(GetArea(OBJECT_SELF), "DO_AMBUSH_CUTSCENE_ONCE") == 0
        || GetLocalInt(GetModule(), "ENTERED_TUNNELS") == 1)
        return;
    object oTrig1 = GetObjectByTag("PopUp1a");
    object oTrig2 = GetObjectByTag("PopUp1b");
    object oTrig3 = GetObjectByTag("PopUp1c");
    string sTag = GetTag(OBJECT_SELF);
    string sNum = GetStringRight(sTag, 1);
    if(sNum == "a")
    {
        DestroyObject(oTrig2);
        DestroyObject(oTrig3);
    }
    else if(sNum == "b")
    {
        DestroyObject(oTrig1);
        DestroyObject(oTrig3);
    }
    else
    {
        DestroyObject(oTrig1);
        DestroyObject(oTrig2);
    }
    ExecuteScript("x0_evt_trigger", OBJECT_SELF);

}

