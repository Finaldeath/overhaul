// Return Sobrey to start location.
void main()
{
    location lLoc = GetLocation(GetObjectByTag("bp_sobrey_return"));

    ActionForceMoveToLocation(lLoc, FALSE, 5.0);
    DelayCommand(5.5, SetFacing(GetFacing(GetObjectByTag("bp_sobrey_return"))));
}
