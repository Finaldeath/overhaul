//Set Map Pin Enabled on Elven Crypt
void main()
{
    object oMapPin = GetWaypointByTag("mn_q1r_elvencrypt");

    SetMapPinEnabled(oMapPin, TRUE);

}
