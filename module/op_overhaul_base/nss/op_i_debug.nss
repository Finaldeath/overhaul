//::///////////////////////////////////////////////
//:: Overhaul Include: Debug
//:: op_i_debug.nss
//:://////////////////////////////////////////////
/*
    Overhaul debug functions.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

const string DEBUG_COLOUR_ERROR     = "<c\xFF\x01\x01>"; // bright red.
const string DEBUG_COLOUR_WARNING   = "<c\xFF\x66\x01>"; // Orange
const string DEBUG_COLOUR_INFO      = "<c\x99\xFF\xFF>"; // Cyan blue
const string DEBUG_COLOUR_END       = "</c>";

// Debug levels
const int LOG_LEVEL_NONE    = 0;  // No debug - if recompiled all debug is stripped
const int LOG_LEVEL_ERROR   = 1;  // Errors only
const int LOG_LEVEL_WARNING = 2;  // Warnings and errors only
const int LOG_LEVEL_INFO    = 3;  // All debug - every piece of information available

// Set to the types of debug you want as per above
const int DEBUG_LEVEL = LOG_LEVEL_INFO;

// Print sDebug in various places depending on the nDebugLevel
void OP_Debug(string sDebug, int nLogLevel = LOG_LEVEL_INFO);

// Print sDebug in various places depending on the nDebugLevel
void OP_Debug(string sDebug, int nLogLevel = LOG_LEVEL_INFO)
{
    if (nLogLevel > DEBUG_LEVEL) return;

    // _ _FUNCTION__, __FILE__,__LINE__, __DATE__ and __TIME__
    sDebug = "[" + GetScriptName() + "] " + sDebug;

    WriteTimestampedLogEntry(sDebug);

    switch (nLogLevel)
    {
        case LOG_LEVEL_ERROR:   sDebug = DEBUG_COLOUR_ERROR + sDebug + DEBUG_COLOUR_END;
        case LOG_LEVEL_WARNING: sDebug = DEBUG_COLOUR_WARNING + sDebug + DEBUG_COLOUR_END;
        case LOG_LEVEL_INFO:    sDebug = DEBUG_COLOUR_INFO + sDebug + DEBUG_COLOUR_END;
    }

    SendMessageToPC(GetFirstPC(), sDebug);

    // SpeakString(sDebug);
}
