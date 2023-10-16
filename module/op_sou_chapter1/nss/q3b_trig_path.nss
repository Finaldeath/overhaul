// path trigger on-enter event: find all nearest path effects and activate it. Activates all within
// a distance of less then 5.0m.

void main()
{
    int i = 1;
    object oEnter = GetEnteringObject();
    // Note: Activating for all creatures so it would work for associates also.
    if(!GetIsPC(oEnter))
        return;
    object oCenter = GetNearestObjectByTag("Q3B_WP_CENTER");
    object oPath = GetNearestObject(OBJECT_TYPE_PLACEABLE, oCenter, i);

    //AssignCommand(oEnter, SpeakString("BOOM!"));

    while (oPath != OBJECT_INVALID)
    {
        float fDistance = GetDistanceBetween(oCenter, oPath);
        //AssignCommand(oEnter, SpeakString("TRIGGER NEW TARGET: distance=" + FloatToString(fDistance) +" TO EFFECT: " + GetTag(oPath)));
        if(fDistance > 6.0)
            return;

        i++;
        if(GetStringLeft(GetTag(oPath), 7) == "Q3_PATH")
        {
            // AssignCommand(oEnter, SpeakString("TRIGGER SIGNALED"));
            SignalEvent(oPath, EventUserDefined(101));
        }
        //AssignCommand(oEnter, SpeakString("BOOM: " + GetName(oPath)));
        oPath = GetNearestObject(OBJECT_TYPE_PLACEABLE, oCenter, i);
    }
}
