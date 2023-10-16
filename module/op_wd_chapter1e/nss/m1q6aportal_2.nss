void main()
{
    if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oFenthick")) &&
       !GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oDesther")) &&
       GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6A01HelmitesKilled") >= 6 &&
       GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPostRitual"))
    {
        object oEnter = GetEnteringObject();
        if(GetIsPC(oEnter))
        {
            location lLoc = GetLocation(GetObjectByTag("WP_M1Q6A_M1Q6E"));
            AssignCommand(oEnter,ClearAllActions());
            AssignCommand(oEnter,JumpToLocation(lLoc));
        }
    }
}
