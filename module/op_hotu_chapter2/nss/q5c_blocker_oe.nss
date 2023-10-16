// Prevent spiders from moving beyond this point

void main()
{
    object oEnter = GetEnteringObject();
    object oWP = GetNearestObjectByTag("q3c_wp_spider_jump");

    if(GetTag(oEnter) == "NW_SPIDSWRD" || GetTag(oEnter) == "NW_SPIDDIRE")
    {
        AssignCommand(oEnter, ClearAllActions());
        AssignCommand(oEnter, JumpToObject(oWP));
    }
}
