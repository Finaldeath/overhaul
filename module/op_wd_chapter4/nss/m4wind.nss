// * sets the weather to the default weather settings, which should include wind
void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
    SetWeather(GetArea(OBJECT_SELF), WEATHER_USE_AREA_SETTINGS);
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE",1);
    }

}
