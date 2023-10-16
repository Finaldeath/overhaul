// re-join henchmen if the player is inside the arena while leaving
// (henchmen are removed when the player is inside the arena)

// NOTICE: removed the code below since the henchmen appeared with the player in hell when he died.

void main()
{
    /*object oExit = GetExitingObject();
    if(!GetIsPC(oExit))
        return;
    object oCleric = GetObjectByTag("q6_priest");
    int nStatus = GetLocalInt(oCleric, "STATUS");
    if(nStatus == 2) // -> player is inside the arena
    {
        object oObject = GetFirstObjectInArea(OBJECT_SELF);
        while(oObject != OBJECT_INVALID)
        {
            if(GetStringLeft(GetTag(oObject), 6) == "x2_hen")
                AddHenchman(oExit, oObject);
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }
    } */
}
