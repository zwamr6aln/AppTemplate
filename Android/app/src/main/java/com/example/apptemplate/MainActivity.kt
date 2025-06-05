package com.example.apptemplate

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { AppTemplateApp() }
    }
}

@Composable
fun AppTemplateApp() {
    val navController = rememberNavController()
    MaterialTheme {
        NavHost(navController = navController, startDestination = "home") {
            composable("home") { HomeScreen(navController) }
            composable("about") { AboutScreen() }
        }
    }
}

@Composable
fun HomeScreen(navController: NavController) {
    Scaffold(
        topBar = { TopAppBar(title = { Text(text = "AppTemplate") }) }
    ) { innerPadding ->
        Column(
            modifier = Modifier
                .padding(innerPadding)
                .padding(16.dp)
        ) {
            Button(onClick = { navController.navigate("about") }) {
                Text(text = "About App")
            }
            Spacer(Modifier.height(16.dp))
            Text(text = "Placeholder")
        }
    }
}

@Composable
fun AboutScreen() {
    Scaffold(
        topBar = { TopAppBar(title = { Text(text = "About App") }) }
    ) { innerPadding ->
        Column(
            modifier = Modifier
                .padding(innerPadding)
                .padding(16.dp)
        ) {
            Text(text = "AppTemplate")
            Spacer(Modifier.height(8.dp))
            Text(text = "This application doesn't collect user information.")
        }
    }
}
